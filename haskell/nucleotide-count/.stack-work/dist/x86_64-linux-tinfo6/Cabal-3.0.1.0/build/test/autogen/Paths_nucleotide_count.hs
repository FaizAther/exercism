{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_nucleotide_count (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,3,0,8] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/debian/exercism/haskell/nucleotide-count/.stack-work/install/x86_64-linux-tinfo6/2e8f662810c78bd72ba9fafbed09f9bfdbaa646c627e05648b035941adf27118/8.8.4/bin"
libdir     = "/home/debian/exercism/haskell/nucleotide-count/.stack-work/install/x86_64-linux-tinfo6/2e8f662810c78bd72ba9fafbed09f9bfdbaa646c627e05648b035941adf27118/8.8.4/lib/x86_64-linux-ghc-8.8.4/nucleotide-count-1.3.0.8-KRBd8zhErhc89QoPQfBcH1-test"
dynlibdir  = "/home/debian/exercism/haskell/nucleotide-count/.stack-work/install/x86_64-linux-tinfo6/2e8f662810c78bd72ba9fafbed09f9bfdbaa646c627e05648b035941adf27118/8.8.4/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/debian/exercism/haskell/nucleotide-count/.stack-work/install/x86_64-linux-tinfo6/2e8f662810c78bd72ba9fafbed09f9bfdbaa646c627e05648b035941adf27118/8.8.4/share/x86_64-linux-ghc-8.8.4/nucleotide-count-1.3.0.8"
libexecdir = "/home/debian/exercism/haskell/nucleotide-count/.stack-work/install/x86_64-linux-tinfo6/2e8f662810c78bd72ba9fafbed09f9bfdbaa646c627e05648b035941adf27118/8.8.4/libexec/x86_64-linux-ghc-8.8.4/nucleotide-count-1.3.0.8"
sysconfdir = "/home/debian/exercism/haskell/nucleotide-count/.stack-work/install/x86_64-linux-tinfo6/2e8f662810c78bd72ba9fafbed09f9bfdbaa646c627e05648b035941adf27118/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "nucleotide_count_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "nucleotide_count_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "nucleotide_count_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "nucleotide_count_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "nucleotide_count_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "nucleotide_count_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
