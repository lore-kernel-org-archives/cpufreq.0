From: bugme-daemon@osdl.org
Subject: [Bug 3180] powernowk8 compiles into kernel only if
	CONFIG_ACPI_PROCESSOR=y
Date: Tue, 10 Aug 2004 06:01:47 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200408101301.i7AD1lbT014437@fire-1.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugme.osdl.org/show_bug.cgi?id=3180





------- Additional Comments From taeuber@informatik.hu-berlin.de  2004-08-10 06:01 -------
Yes it does still appear after applying the latest from
cpufreq-bk on top of -rc4

the error is:

  CC      arch/x86_64/kernel/cpufreq/../../../i386/kernel/cpu/cpufreq/powernow-k8.o
In file included from arch/i386/kernel/cpu/cpufreq/powernow-k8.c:43:
arch/i386/kernel/cpu/cpufreq/powernow-k8.h:35: error: field `acpi_data' has
incomplete type
make[2]: ***
[arch/x86_64/kernel/cpufreq/../../../i386/kernel/cpu/cpufreq/powernow-k8.o] Error 1
make[1]: *** [arch/x86_64/kernel/cpufreq] Error 2
make: *** [arch/x86_64/kernel] Error 2


Lars


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
