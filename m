From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6938] use of cpufreq (with any cpufreqd-like deamon) has
	strange influence on the acpi functions of an IBM Thinkpad X21
Date: Mon, 23 Oct 2006 06:04:55 -0700
Message-ID: <200610231304.k9ND4tKR007623@fire-2.osdl.org>
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

herrmann-tom@gmx.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|normal                      |blocking
     Kernel Version|2.6.16-rc1 and all newer    |2.6.16-rc2 and all newer
                   |(2.6.18-rc3 is most recent  |(2.6.19-rc2 is most recent
                   |now)                        |now)
            Summary|use of cpufreq (with any    |use of cpufreq (with any
                   |cpufreqd-like deamon) has   |cpufreqd-like deamon) has
                   |strange influence on the    |strange influence on the
                   |embeded controler functions |acpi functions of an IBM
                   |of an IBM Thinkpad X21      |Thinkpad X21



------- Additional Comments From herrmann-tom@gmx.de  2006-10-23 05:52 -------
This bug is still present in latest kenel versions.

Because of security and feature lack while using the old 2.6.15.7 kernel I am
going to think about not using linux anymore.

Disable speedstep realy is no option on a (sub-)notebook

It would be greate if someone could even try to fix this bug.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
