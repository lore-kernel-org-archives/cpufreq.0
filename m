From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 1/2] Move PMBASE reading away and do it only once at
	initialization time
Date: Wed, 30 Nov 2005 22:00:59 +0100
Message-ID: <20051130210059.GC3620@inferi.kami.home>
References: <11333087112659-git-send-email-malattia@linux.it>
	<438D86E3.9070502@lifl.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="k1lZvvs/B4yU6o8G"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <438D86E3.9070502@lifl.fr>
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
To: Eric Piel <Eric.Piel@lifl.fr>
Cc: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, Eric Piel <eric.piel@tremplin-utc.net>, Dominik Brodowski <linux@dominikbrodowski.net>, davej@redhat.com


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 30, 2005 at 12:02:59PM +0100, Eric Piel wrote:
[...]
> >@@ -400,6 +415,10 @@ static int __init speedstep_init(void)
> > 		return -EINVAL;
> > 	}
> > 
> >+	if (speedstep_find_register()) {
> >+		return -ENODEV;
> >+	}
> >+
> Please, keep it simple and do put { and } when there is only one line.

I assume you meant "do not put" :)
attached the fixed patch (with removed extra white space also).

This patch moves away PMBASE reading and only performs it at
cpufreq_register_driver time by exiting with -ENODEV if unable to read                                                                                
the value.

Signed-off-by: Mattia Dongili <malattia@linux.it>
-- 
mattia
:wq!

--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="move_pmbase_reading.diff"

diff --git a/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c b/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
index 5b7d18a..77efe8e 100644
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
@@ -40,6 +40,7 @@ static struct pci_dev *speedstep_chipset
  */
 static unsigned int speedstep_processor = 0;
 
+static u32 pmbase;
 
 /*
  *   There are only two frequency states for each processor. Values
@@ -56,34 +57,47 @@ static struct cpufreq_frequency_table sp
 
 
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
 
@@ -400,6 +414,9 @@ static int __init speedstep_init(void)
 		return -EINVAL;
 	}
 
+	if (speedstep_find_register())
+		return -ENODEV;
+
 	return cpufreq_register_driver(&speedstep_driver);
 }
 

--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--k1lZvvs/B4yU6o8G--

