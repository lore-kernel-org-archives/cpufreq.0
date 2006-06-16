From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6699] New: Possible Frequencies steps changed with kernel
	upgrade in p4-clockmod
Date: Fri, 16 Jun 2006 09:48:44 -0700
Message-ID: <200606161648.k5GGmiuf013025@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6699

           Summary: Possible Frequencies steps changed with kernel upgrade
                    in p4-clockmod
    Kernel Version: 2.6.16.20
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: tkrah@fachschaft.imn.htwk-leipzig.de


Most recent kernel where this bug did not occur: 2.6.15.6
Distribution: Debian Sarge
Hardware Environment: Dell Power Edge 1600SC with 2800 GHz P4 Xeon HT
Software Environment:
Problem Description: Using the new kernel, cpufreq-info only shows:

hardware limits: 2.10 GHz - 2.80 GHz
available frequency steps: 2.10 GHz, 2.45 GHz, 2.80 GHz

With the 2.6.15 version it shows much more:

hardware limits: 350 MHz - 2.80 GHz
available frequency steps: 350 MHz, 700 MHz, 1.05 GHz, 1.40 GHz, 1.75 GHz, 2.10
GHz, 2.45 GHz, 2.80 GHz

Steps to reproduce: Boot with 2.6.16.20 Kernel and watch cpufreq-info output.

kind regards

Torsten

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
