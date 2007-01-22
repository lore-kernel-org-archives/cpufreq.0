From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7859] Frequency can't switch on a dual Turion 64
Date: Mon, 22 Jan 2007 08:47:07 -0800
Message-ID: <200701221647.l0MGl78Q002143@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7859





------- Additional Comments From roms@lievin.net  2007-01-22 08:39 -------
I have added your printk line at the end of acpi_processor_ppc_notifier() but
before the verify call. On the other hand, I forgot to add it in the
for_each_cpu_mask loop. I have the call once at module load time (see
cpufreq2.dmesg).

As stated in your mail, I have added the marc's patch and I'm happy to tell you
that's working. I have changed governor twice as you may see in the
cpufreq3.dmesg log.

As a final check, I will try and build a UP kernel. More report later.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
