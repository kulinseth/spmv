import os
import subprocess

import InstSet_Double_x86_SSE4
import CodeGen_BCSRRowMaj_Matmul

class Benchmarker_OSKIBench:
    def __init__(self, autotuner):
        self.Autotuner = autotuner
        self.Results = {}
       
    def ParamsToProfileName(self, params):
        profileParams = ""
        paramKeys = list(param for param in params.iterkeys())
        paramKeys.sort()
        for param in paramKeys:
            profileParams += param + "-" + str(params[param]) + "_"
        return profileParams[0:-1] + ".dat"
       
    def ParamsToTuple(self, params):
        profileParams = []
        paramKeys = list(param for param in params.iterkeys())
        paramKeys.sort()
        for param in paramKeys:
            profileParams.append( (param, str(params[param])) )
            
        return tuple(profileParams)

    def TupleToParams(self, paramsTuple):
        params = {}
        for paramSet in paramsTuple:
            param, val = paramSet
            params[param] = val
        return params
            
    """
    Function for interacting with the OSKI internal benchmarking script
    (make bench)
    """
    def RunBenchmark(self, codeGen, instSet, params):
        """
        Runs a benchmark for the code generated by codeGen
        using instruction set instSet.
        """
        oskiProfile = "profile_" + codeGen.GetDataStructure()   \
                            + "_" + codeGen.GetOperation()      \
                            + "_" + instSet.GetOSKIDataType()
        oskiProfileName = oskiProfile + ".dat"
        oskiProfilePath = self.Autotuner.BuildDir + "/bench" 
        oskiProfileFile = oskiProfilePath + "/" + oskiProfileName
        
        tunerProfileName = self.ParamsToProfileName(params)
        tunerProfilePath = self.Autotuner.BuildDir + "/autotuner/bench/" + oskiProfile
        tunerProfileFile = tunerProfilePath + "/" + tunerProfileName 
        
        print("Benchmark file: " + tunerProfileFile)
        
        if (os.path.isfile(tunerProfileFile)):
            print("Benchmark file already exists - not running again")
        else:
            if (os.path.isfile(oskiProfileFile)):
                print("Removing previous OSKI benchmark")
                os.remove(oskiProfileFile)
    
            print("Starting benchmark")
            benchmarker = subprocess.Popen(["make", oskiProfileName],
                                           cwd=oskiProfilePath,
                                           stdout = subprocess.PIPE,
                                           stderr = subprocess.PIPE)
            
            print(" ... waiting for benchmark")
            (benchout, bencherr) = benchmarker.communicate()
            print(" ... benchmark completed")
            
            print("Moving results to autotuning directory")
            os.renames(oskiProfileFile, tunerProfileFile)
            
        print("Processing results")
        profileFile = open(tunerProfileFile)
        profileLines = profileFile.readlines()
        profileFile.close()
            
        paramsTuple = self.ParamsToTuple(params)
        for line in profileLines:
            lineSplit = line.split(" ")
            codeParams = (int(lineSplit[0]), int(lineSplit[1]))
            if not(self.Results.has_key(codeParams)):
                self.Results[codeParams] = {}
                    
            self.Results[codeParams][paramsTuple] = lineSplit[3]
                
            print("Result for " + str(paramsTuple) + " with " + str(codeParams) \
                + ": " + self.Results[codeParams][paramsTuple])
        
    def GetBest(self, codeParams):
        """
        Returns the best tuned parameters for the given codeParams
        from the benchmark
        """
        codeParamsTuple = (codeParams["r"], codeParams["c"])
        results = self.Results[codeParamsTuple]
        
        bestTuningParams = None
        bestResults = 0
        for tuningParams, benchResults in results.iteritems():
            if (benchResults > bestResults):
                bestResults = benchResults
                bestTuningParams = tuningParams
        return self.TupleToParams(bestTuningParams)
            
if __name__ == '__main__':
    """
    The main function, which runs a benchmark on BCSR code using the parameters
    MultiplyOrder=Normal, ReduceStyle=DotProduct, PrefetchDist=64
    """
    benchmarker = Benchmarker_OSKIBench()
    
    instSet = InstSet_Double_x86_SSE4.InstSet_Double_x86_SSE4()
    codeGen = CodeGen_BCSRRowMaj_Matmul.CodeGen_BCSRRowMaj_Matmul()
    params = {'MultiplyOrder':'Normal', 'ReduceStyle':'DotProduct', 'PrefetchDist':64}
    
    print("Call RunBenchmark")
    benchmarker.RunBenchmark(codeGen, instSet, params)
    print("Done")
    
    
