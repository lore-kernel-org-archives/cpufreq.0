From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7383] New: cpu frequency switching seems to be broken (on
	Intel Conroe 6600), frequencies being shown are wrong
Date: Wed, 18 Oct 2006 02:05:46 -0700
Message-ID: <200610180905.k9I95kmX007476@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7383

           Summary: cpu frequency switching seems to be broken (on Intel
                    Conroe 6600), frequencies being shown are wrong
    Kernel Version: 2.6.19-rc2-mm1
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: jackdachef@gmail.com


Most recent kernel where this bug did not occur: 2.6.19-rc2
Distribution: GNU/Gentoo Linux
Hardware Environment: Intel Conroe 6600 (Core 2 Duo), Asus P5W DH Deluxe
Software Environment: x86, powernowd, gnome
Problem Description: frequencies being displayed aren't correct, frequency
switching doesn't seem to work: it stays at the highest frequency: 2.6 GHz

Steps to reproduce: start in system, frequency switching: userspace, start powernowd

cat scaling_available_frequencies
2394000 1596000 1 0 33554432 0 -1339546588 -1339546588 -313505024 -407094144 

 cat cpuinfo_max_freq
3981462272 

cat cpuinfo_min_freq
0

cat scaling_driver
acpi-cpufreq 

can this harm hardware ?

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
