

function exe0(dirpath)
cwd=joinpath(dirpath,"hello.in")#make path to hello
    if ispath(cwd)#cheak if hello.in exist
        try
            open(cwd)do f #open hello.in
                open("exemple.text","w")do writeFile #open (or creat if not exist) exemple.text at the current directory to write
                    write(writeFile,f) #write hello.in to exemple.text
                end#open exemple
            end#open cwd
            open("exemple.text")do file #print every line from exemple that contain the word 'you'
                for i in readlines(file)#read all the file to arry by line
                    if occursin("you",i)
                    write(stdout,i,"\n")
                end#if occursin
            end #for readlines
        end#open exemple
        catch exc
            println(exc)
        end#catch
    end#if ispath
    for i in readdir(dirpath) #foreach file or dir in dirpath
        if !isdir(i)
            f=joinpath(dirpath,i)
            txt="" #make var for the contain of the file
            open(f,"r")do arg #read all the file to array
                txt=readlines(arg)
            end#open f
            open(f,"w")do args
                for i in enumerate(txt) #enumerate itearate on the file
                    write(args,"$(i[1]). $(i[2])\n")#the first element is the num in the itertor
                end#for enumerate
            end#open f

        end#if !isdir

    end#for readdir
end#function exe0

exe0("C:\\Users\\AVI\\.atom\\julia-projects\\exercises\\exercise_0")
