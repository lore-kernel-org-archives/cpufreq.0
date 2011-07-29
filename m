From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] cpufreq: Fix build of s3c64xx cpufreq driver for header
 change
Date: Fri, 29 Jul 2011 10:48:02 -0400
Message-ID: <20110729144802.GB1422@redhat.com>
References: <1311949618-919-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1311949618-919-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

On Fri, Jul 29, 2011 at 03:26:58PM +0100, Mark Brown wrote:
 > Some header change has removed an implicit include of module.h, breaking
 > the build due to the use of THIS_MODULE. Fix that.

is this dependant on the module.h changes that just got merged in -next
from Paul Gortmaker ?  If so, it should probably get merged as part of that set.

	Dave 

 > Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
 > ---
 >  drivers/cpufreq/s3c64xx-cpufreq.c |    1 +
 >  1 files changed, 1 insertions(+), 0 deletions(-)
 > 
 > diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c b/drivers/cpufreq/s3c64xx-cpufreq.c
 > index b8d1d20..3475f65 100644
 > --- a/drivers/cpufreq/s3c64xx-cpufreq.c
 > +++ b/drivers/cpufreq/s3c64xx-cpufreq.c
 > @@ -15,6 +15,7 @@
 >  #include <linux/clk.h>
 >  #include <linux/err.h>
 >  #include <linux/regulator/consumer.h>
 > +#include <linux/module.h>
 >  
 >  static struct clk *armclk;
 >  static struct regulator *vddarm;
 > -- 
 > 1.7.5.4

