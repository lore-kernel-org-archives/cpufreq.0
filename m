From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 1/2] Move PMBASE reading away and do it only once at
	initialization time
Date: Wed, 30 Nov 2005 00:58:31 +0100
Message-ID: <11333087112659-git-send-email-malattia@linux.it>
References: <11333087113994-git-send-email-malattia@linux.it>
Reply-To: Mattia Dongili <malattia@linux.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <11333087113994-git-send-email-malattia@linux.it>
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
Content-Type: text/plain; charset="us-ascii"
To: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>
Cc: Eric Piel <eric.piel@tremplin-utc.net>, Dominik Brodowski <linux@dominikbrodowski.net>, davej@redhat.com

Signed-off-by: Mattia Dongili <malattia@linux.it>

---

 arch/i386/kernel/cpu/cpufreq/speedstep-ich.c |   45 ++++++++++++++++++--------
 1 files changed, 32 insertions(+), 13 deletions(-)

applies-to: 41c86716d1584bad6ddf55c9132ef8b820bc1b15
31c370b9ba20188340635fd7cebc150c4b71b097
diff --git a/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c b/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
index 5b7d18a..17b7864 100644
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
@@ -40,6 +40,7 @@ static struct pci_dev *speedstep_chipset
  */
 static unsigned int speedstep_processor = 0;
 
+static u32 pmbase;
 
 /*
  *   There are only two frequency states for each processor. Values
@@ -56,34 +57,48 @@ static struct cpufreq_frequency_table sp
 
 
 /**
- * speedstep_set_state - set the SpeedStep state
- * @state: new processor frequency state (SPEEDSTEP_LOW or SPEEDSTEP_HIGH)
+ * speedstep_find_register - read the PMBASE address
  *
- *   Tries to change the SpeedStep state.
+ * Returns: -ENODEV if no register could be found
  */
-static void speedstep_set_state (unsigned int state)
+static int speedstep_find_register (void)
 {
-	u32 pmbase;
-	u8 pm2_blk;
-	u8 value;
-	unsigned long flags;
-
-	if (!speedstep_chipset_dev || (state > 0x1))
-		return;
+	
+	if (!speedstep_chipset_dev)
+		return -ENODEV;
 
 	/* get PMBASE */
 	pci_read_config_dword(speedstep_chipset_dev, 0x40, &pmbase);
 	if (!(pmbase & 0x01)) {
 		printk(KERN_ERR "speedstep-ich: could not find speedstep register\n");
-		return;
+		return -ENODEV;
 	}
 
 	pmbase &= 0xFFFFFFFE;
 	if (!pmbase) {
 		printk(KERN_ERR "speedstep-ich: could not find speedstep register\n");
-		return;
+		return -ENODEV;
 	}
 
+	dprintk("pmbase is 0x%x\n", pmbase);
+	return 0;
+}
+
+/**
+ * speedstep_set_state - set the SpeedStep state
+ * @state: new processor frequency state (SPEEDSTEP_LOW or SPEEDSTEP_HIGH)
+ *
+ *   Tries to change the SpeedStep state.
+ */
+static void speedstep_set_state (unsigned int state)
+{
+	u8 pm2_blk;
+	u8 value;
+	unsigned long flags;
+
+	if (state > 0x1)
+		return;
+
 	/* Disable IRQs */
 	local_irq_save(flags);
 
@@ -400,6 +415,10 @@ static int __init speedstep_init(void)
 		return -EINVAL;
 	}
 
+	if (speedstep_find_register()) {
+		return -ENODEV;
+	}
+
 	return cpufreq_register_driver(&speedstep_driver);
 }
 
---
0.99.9.GIT
