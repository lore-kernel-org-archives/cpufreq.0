From: bugme-daemon@kernel-bugs.osdl.org
Subject: [Bug 5407] CPUFrequency driver for AMD K8 crashes PC with Sempron
	3400+ CPU
Date: Thu, 13 Oct 2005 04:09:01 -0700
Message-ID: <200510131109.j9DB91SN027346@fire-1.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5407





------- Additional Comments From t.artem@mailcity.com  2005-10-13 04:06 -------
Here's a response from GigaByte engineers (I asked them why my Windows XP hangs
when I enable cool'n'quite support under this OS):

"Dear Artem,

As for the problem you mentioned, please kindly notice that release date of
latest AMD Sempron cool'n'quite drivers is May 2005 but your Sempron processor
(Palermo E6) was released in June-July 2005 thus we suggest you to await new
drivers version from AMD or kindly push them to release new version soon. BTW,
you can uninstall these drivers under windows safe mode."

So I may say that cpufreq linux driver is indeed buggy and needs to be updated
for proper AMD Sempron Palermo E6 family support.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
