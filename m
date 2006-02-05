From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5553] speedstep-smi fails to load if CONFIG_CPU_FREQ_DEBUG is
	not set
Date: Sun, 5 Feb 2006 06:08:33 -0800
Message-ID: <200602051408.k15E8XwT019939@fire-2.osdl.org>
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





------- Additional Comments From miura@da-cha.org  2006-02-05 06:08 -------
Uhmm, it seems some cache coherency problem.
Touching 'command' variable in printk() flashes cache including 'magic_data',
doesn't it?

How about moving definition of magic_data[] to global?
The valiable will be initialized at load time. 
--- speedstep-smi.c.orig        2005-09-17 10:02:12.000000000 +0900
+++ speedstep-smi.c     2006-02-05 23:52:16.000000000 +0900
@@ -61,11 +61,13 @@
 /**
  * speedstep_smi_ownership
  */
+
+static unsigned char magic_data[] = "Copyright (c) 1999 Intel Corporation";
+
 static int speedstep_smi_ownership (void)
 {
        u32 command, result, magic;
        u32 function = GET_SPEEDSTEP_OWNER;
-       unsigned char magic_data[] = "Copyright (c) 1999 Intel Corporation";

        command = (smi_sig & 0xffffff00) | (smi_cmd & 0xff);
        magic = virt_to_phys(magic_data);

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
