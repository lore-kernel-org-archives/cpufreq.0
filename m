From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8255] Frequency Scaling not working properly using powernow-k7
Date: Sat, 9 Jun 2007 05:56:14 -0700
Message-ID: <200706091256.l59CuEOv014942@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8255





------- Additional Comments From cimmo@libero.it  2007-06-09 06:00 -------
Hi,
I have the same problem here with an asus L3D notebook that previously has an
Athlon XP-M 2000+ that was 1600 Mhz and was recognized perfectly.

Now there is an Athlon XP-M 2400+ that has 1800 Mhz and when kernel is started
is recognized well after powernow recognized it as min and max = 1473 Mhz.
I've tried latest ubuntu gutsy snapshot that has kernel 2.6.22-6 that in theory
has 2.6.22rc2 but I'm not quite sure, so I don't know if it has this patch
included or not.

Can be my problem related? I attach dmesg.

Thanx

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
