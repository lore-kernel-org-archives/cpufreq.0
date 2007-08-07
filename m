From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8228] acpi-cpufreq does not load - Fujitsu Siemens Amilo M1425,
	M1437G - Intel(R) Pentium(R) M
Date: Tue,  7 Aug 2007 15:58:17 -0700 (PDT)
Message-ID: <20070807225818.6A6F910805A@picon.linux-foundation.org>
References: <bug-8228-3570@http.bugzilla.kernel.org/>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-8228-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8228


len.brown@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REJECTED                    |CLOSED
          Component|Config-Processors           |BIOS




------- Comment #48 from len.brown@intel.com  2007-08-07 16:04 -------
Thanks for following-up Daniel.
Curious that speedstep-centrino tables for Dothan
was what made this work for you in Ubuntu-2.6.17
and that upgrading the BIOS make acpi-cpufreq start working.
It makes one wonder what Windows would do with the old BIOS
on that machine.

As we haven't heard from Uwe, the original poster, in months,
we'll assume he's somehow magically happy with the upstream kernel
and we'll file this one into the broken BIOS bucket.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
