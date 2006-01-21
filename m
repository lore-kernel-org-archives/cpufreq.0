From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5553] speedstep-smi fails to load if CONFIG_CPU_FREQ_DEBUG is
	not set
Date: Sat, 21 Jan 2006 13:24:12 -0800
Message-ID: <200601212124.k0LLOCIS014489@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5553





------- Additional Comments From tm@del.bg  2006-01-21 13:24 -------
Created an attachment (id=7093)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=7093&action=view)
change dprintk to printk in speedstep_smi_ownership()


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
