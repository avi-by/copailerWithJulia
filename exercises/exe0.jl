

function exe0(dirpath)
dirpath="C:\\Users\\AVI\\.atom\\julia-projects\\exercises\\exercise_0"
cwd=joinpath(dirpath,"hello.in")
    if ispath(cwd)
        try
            open(cwd)do f
                open("exemple.text","w")do writeFile
                    write(writeFile,f)
                end
            end
            open("exemple.text")do file
                for i in readlines(file)
                    if occursin("you",i)
                    write(stdout,i,"\n")
                end
                end
            end
        catch exc
            println(exc)
        end
    end
    for i in readdir(dirpath)
        if isfile(i)
            try
            f=joinpath(dirpath,i)
            txt=""
            open(f,"r")do arg
                global txt=readlines(arg)
            end
            breakpoint("3")
            open(f,"w")do args
                for i in enumerate(txt)
                    write(args,"$(i[1]). $(i[2])\n")
                end
            end    
            catch exc
                println(exc)
            end
        end

    end
end
#=function recExe0()

    for x in readdir(pwd())
            if isdir(x)
                exe0(x)
            end
    end

end
=#
#recExe0()
#=function test()
try
    f=open("C:\\Users\\AVI\\.atom\\julia-projects\\exercises\\exercise_0","w")
    print("f")
    close(f)
catch e
    println(e)
end
end
=#
@interpret exe0("C:\\Users\\AVI\\.atom\\julia-projects\\exercises\\exercise_0")
