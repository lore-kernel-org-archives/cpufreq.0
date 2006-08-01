From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6938] New: use of cpufreq (with any cpufreqd-like deamon) has
	strange influence on the embeded controler functions of an
	IBM Thinkpad X21
Date: Tue, 1 Aug 2006 07:30:17 -0700
Message-ID: <200608011430.k71EUH0F003923@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=6938

           Summary: use of cpufreq (with any cpufreqd-like deamon) has
                    strange influence on the embeded controler functions of
                    an IBM Thinkpad X21
    Kernel Version: 2.6.16-rc1 and all newer (2.6.18-rc3 is most recent now)
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: herrmann-tom@gmx.de


Most recent kernel where this bug did not occur: 2.6.15.X

Distribution: Debian (testing with most recent kernel-package from unstable for
compiling 2.6.18)

Hardware Environment: IBM Thinkpad X21 (Intel Mobile Pentium III [LV], Intel
440ZXM, all but HDD stock components, most recent bios/embeded controler firmware)

Software Environment: normal desktop distribution stuff, cpufreqd (2.1.1) (all
other cpufreq-deamons  dosn't "fix" it so there is no bug)

Problem Description: I normaly use cpufreqd to switch the frequency from this
processor in a "ondemand" way, never had problems with older kernels then 2.6.16.
Because of some strange behavior I had to compile the cpufreq-kernel-option with
debug options, because the relaxed speedstep checks wouldn't work without it,
and are needed for this first generation speedstep.
Then some users reported this "bug" (needed debug option) and someone "fixed"
this in a 2.6.16-rc.
With this and all more recent kernel-versions the error occours:
Booting and the first 2 to 4 minutes of doing something works without a problem,
but after this time (and some freqency switching) I can't use all "special"
functions (as I think) provided by IBM's embeded controler.
switching the volume with the "hardware" buttons gets very slow (normal
switch/respond-time after pressing is <1sek, then it >5sek) and the FN-F*
funktions don't work at all (FN-F7 for Monitor swich, ...)
If I simply don't switch the frequency (disable the deamon) and reboot, the bug
is gone but this is now solution, because the causes mutch more powercounsuming

I have tested any possible cpufreq kernel options combination, but if switching
works, this bug is there...

Steps to reproduce:
compile kernel with any working cpufreq option combination, boot it, switch the
frequency some times, get this bug...

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
