From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9558] Frequency scaling not working after BIOS upgrade on Asus
	F3jc
Date: Fri, 14 Dec 2007 01:44:29 -0800 (PST)
Message-ID: <20071214094429.74B5F11D107@picon.linux-foundation.org>
References: <bug-9558-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9558-3570@http.bugzilla.kernel.org/>
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
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=9558





------- Comment #5 from scurippio@gmail.com  2007-12-14 01:44 -------
I have done some tests, and a strange behavior occurs:

The first time the kernel try to load the acpi-cpufreq module:
ACPI Exception (exoparg2-0442): AE_AML_PACKAGE_LIMIT, Index (0FFFFFFFC) is
beyond end of object [20070126]
ACPI Error (psparse-0537): Method parse/execution failed [\_PR_.CPU1._PSS]
(Node df925cd8), AE_AML_PACKAGE_LIMIT
ACPI Exception (processor_perflib-0234): AE_AML_PACKAGE_LIMIT, Evaluating _PSS
[20070126]
ACPI Exception (exoparg2-0442): AE_AML_PACKAGE_LIMIT, Index (0FFFFFFFC) is
beyond end of object [20070126]
ACPI Error (psparse-0537): Method parse/execution failed [\_PR_.CPU2._PSS]
(Node df925ee8), AE_AML_PACKAGE_LIMIT
ACPI Exception (processor_perflib-0234): AE_AML_PACKAGE_LIMIT, Evaluating _PSS
[20070126]
with consequent Cannot insert module (Device not found)

If I retry to load the module a second time, it works.
Could be something solvable or should I damn Asus for making clueless BIOSes?


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
