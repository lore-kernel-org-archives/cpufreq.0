From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [cpufreq 24] patches
Date: Thu, 2 Sep 2004 12:34:22 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040902103422.GX29560@poupinou.org>
References: <20040831101349.GV29560@poupinou.org>
	<20040831222952.47ecb90f.frx@firenze.linux.it>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040831222952.47ecb90f.frx@firenze.linux.it>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francesco Poli <frx@firenze.linux.it>
Cc: cpufreq@www.linux.org.uk

On Tue, Aug 31, 2004 at 10:29:52PM +0200, Francesco Poli wrote:
> On Tue, 31 Aug 2004 12:13:49 +0200 Bruno Ducrot wrote:
> 
> > Hi,
> > 
> > For those who prefer a patch for 2.4 instead of the cvs stuff
> > (patchin.sh, etc) I put one at:
> > 
> > ftp://ftp.poupinou.org/cpufreq/cpufreq-24-20040831.diff[$EXT]
> > with $EXT in (nothing), .gz, .bz2, and there is now symbolic links
> > cpufreq-24-current.diff[$EXT] to them.
> 
> Many TNX, your job is very much appreciated!  :)
> I will use it as soon as I upgrade to 2.4.28 (that is, as soon as 2.4.28
> itself is out + the time to go back home, rebuild and install... ^__^ )
> 

Well, I just have to do something like this now:

cvs -d :pserver:cvs@pubcvs.arm.linux.org.uk:/mnt/src/cvsroot co -P -RLINUX_2_4 cpufreq
cd cpufreq
ln -s /path/to/kernelvanilla/source linux.original
./patchin.sh linux.original
cat patch patch_core patch_x86 > cpufreq-xxx.diff

This may even work with other kernels who knows.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
