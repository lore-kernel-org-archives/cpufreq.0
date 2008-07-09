From: Dave Jones <davej@codemonkey.org.uk>
Subject: Re: powerpc/cell/cpufreq: add spu aware cpufreq governor
Date: Wed, 9 Jul 2008 02:29:58 -0400
Message-ID: <20080709062958.GA24570@codemonkey.org.uk>
References: <200807071702.31240.arnd@arndb.de>
	<1215580739.8970.317.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1215580739.8970.317.camel@pasglop>
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
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, cpufreq@lists.linux.org.uk, linuxppc-dev@ozlabs.org, Jeremy Kerr <jk@ozlabs.org>, cbe-oss-dev@ozlabs.org

On Wed, Jul 09, 2008 at 03:18:59PM +1000, Ben Herrenschmidt wrote:
 > On Mon, 2008-07-07 at 17:02 +0200, Arnd Bergmann wrote:
 > > From: Christian Krafft <krafft@de.ibm.com>
 > > 
 > > This patch adds a cpufreq governor that takes the number of running spus
 > > into account. It's very similar to the ondemand governor, but not as complex.
 > > Instead of hacking spu load into the ondemand governor it might be easier to
 > > have cpufreq accepting multiple governors per cpu in future.
 > > Don't know if this is the right way, but it would keep the governors simple.
 > > 
 > > Signed-off-by: Christian Krafft <krafft@de.ibm.com>
 > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
 > > ---
 > > 
 > > Dave or other cpufreq people, can you take a look at this
 > > and add an Acked-by when you're happy?
 > > 
 > > We have one prerequisite patch in the powerpc code (in spufs),
 > > so should it get merged through powerpc.git?
 > 
 > Hrm... taking whatever test config I have at hand, applying the patch
 > and doing make oldconfig & make, I get:
 > 
 > ERROR: ".cpufreq_register_governor" [arch/powerpc/platforms/cell/cbe_spu_governor.ko] undefined!
 > ERROR: ".__cpufreq_driver_target" [arch/powerpc/platforms/cell/cbe_spu_governor.ko] undefined!
 > ERROR: ".cpufreq_unregister_governor" [arch/powerpc/platforms/cell/cbe_spu_governor.ko] undefined!
 > ERROR: ".cpufreq_frequency_table_target" [arch/powerpc/platforms/cell/cbe-cpufreq.ko] undefined!
 > ERROR: ".cpufreq_register_driver" [arch/powerpc/platforms/cell/cbe-cpufreq.ko] undefined!
 > ERROR: ".cpufreq_frequency_table_verify" [arch/powerpc/platforms/cell/cbe-cpufreq.ko] undefined!
 > ERROR: ".cpufreq_frequency_table_get_attr" [arch/powerpc/platforms/cell/cbe-cpufreq.ko] undefined!
 > ERROR: ".cpufreq_notify_transition" [arch/powerpc/platforms/cell/cbe-cpufreq.ko] undefined!
 > ERROR: ".cpufreq_frequency_table_cpuinfo" [arch/powerpc/platforms/cell/cbe-cpufreq.ko] undefined!
 > ERROR: ".cpufreq_unregister_driver" [arch/powerpc/platforms/cell/cbe-cpufreq.ko] undefined!
 > ERROR: ".cpufreq_frequency_table_put_attr" [arch/powerpc/platforms/cell/cbe-cpufreq.ko] undefined!

Does this help ?

	Dave
 
diff --git a/arch/powerpc/platforms/cell/Kconfig b/arch/powerpc/platforms/cell/Kconfig
index 3959fcf..19f4b4d 100644
--- a/arch/powerpc/platforms/cell/Kconfig
+++ b/arch/powerpc/platforms/cell/Kconfig
@@ -91,6 +91,7 @@ config CBE_THERM
 config CBE_CPUFREQ
 	tristate "CBE frequency scaling"
 	depends on CBE_RAS && CPU_FREQ
+	select CPU_FREQ_TABLE
 	default m
 	help
 	  This adds the cpufreq driver for Cell BE processors.
-- 
http://www.codemonkey.org.uk
