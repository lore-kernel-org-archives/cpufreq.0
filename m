From: bugme-daemon@osdl.org
Subject: [Bug 3180] powernowk8 compiles into kernel only if
	CONFIG_ACPI_PROCESSOR=y
Date: Tue, 10 Aug 2004 05:27:41 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200408101227.i7ACRfa3011647@fire-1.osdl.org>
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





------- Additional Comments From linux@brodo.de  2004-08-10 05:27 -------
Does the issue appear in 2.6.8-rc3-mmX, or after applying the latest from
cpufreq-bk which is contained in this patch:
http://www.codemonkey.org.uk/projects/bitkeeper/cpufreq/cpufreq-2004-08-10.diff
on top of -rc4?

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
