From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8255] Frequency Scaling not working properly using powernow-k7
Date: Thu, 29 Mar 2007 06:04:01 -0700
Message-ID: <200703291304.l2TD419t016387@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8255





------- Additional Comments From bugzilla.20.dsurawicz@spamgourmet.com  2007-03-29 06:04 -------
Okay. I tracked down the problem with git. Here is what is the submission that
causes the problem:

solaris linux-git # git bisect good
0916bd3ebb7cefdd0f432e8491abe24f4b5a101e is first bad commit
commit 0916bd3ebb7cefdd0f432e8491abe24f4b5a101e
Author: Dave Jones <davej@redhat.com>
Date:   Wed Nov 22 20:42:01 2006 -0500

        [PATCH] Correct bound checking from the value returned from _PPC method.
        
        processor_perflib.c::acpi_processor_ppc_notifier() check if the value
        returned by the processor's _PPC method is 0 and return failed if so.
        This is wrong since 0 indicate that the bios think the processor can go
        to the highest frequency.  This patch for example fix the HP NX 6125 to
        allow its highest frequency to be available.

        Signed-off-by: Bruno Ducrot <ducrot@poupinou.org>
        Cc: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
        Signed-off-by: Dave Jones <davej@redhat.com>
        Signed-off-by: Linus Torvalds <torvalds@osdl.org>

        :040000 040000 d6696bf57e1a08b39e051bcf22c838723ccdf0bf
a67b7741e5163c598cb3663c7997dc663516695e M      drivers


Maybe someone can look into it.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
