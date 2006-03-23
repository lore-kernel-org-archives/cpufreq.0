From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5553] speedstep-smi fails to load if CONFIG_CPU_FREQ_DEBUG is
	not set
Date: Thu, 23 Mar 2006 11:24:14 -0800
Message-ID: <200603231924.k2NJOEce012243@fire-2.osdl.org>
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





------- Additional Comments From ospite@studenti.unina.it  2006-03-23 11:24 -------
Hallo, I also have this problem on linux 2.6.16, and the patch in
http://bugzilla.kernel.org/show_bug.cgi?id=5553#c8 does not help.

I found that any printk() statement before the asm code seems to fix the symptom
(hence the driver can be loaded without problems).

Just for istance, the following patch make the module loadable without touching
explicitly the 'command' variable or anything else.

--- speedstep-smi.c.orig	2006-03-23 19:22:05.000000000 +0100
+++ speedstep-smi.c	2006-03-23 20:05:28.000000000 +0100
@@ -70,6 +70,7 @@ static int speedstep_smi_ownership (void
 	command = (smi_sig & 0xffffff00) | (smi_cmd & 0xff);
 	magic = virt_to_phys(magic_data);
 
+	printk("Loading speedstep-smi.\n");
 	dprintk("trying to obtain ownership with command %x at port %x\n", command,
smi_port);
 
 	__asm__ __volatile__(


Maybe a workaround like this can be used in a future kernel version to let users
load the module, while thinking to a real fix (it sounds a bit 'redmondish', I
know :) )

Thanks,
   Antonio Ospite.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
