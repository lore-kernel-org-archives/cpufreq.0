From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 2/2] Longhaul - Add voltage scaling to driver
Date: Tue, 15 Aug 2006 18:06:05 -0400
Message-ID: <20060815220605.GW7612@redhat.com>
References: <44E23ED0.4090607@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44E23ED0.4090607@interia.pl>
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
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Cc: cpufreq@lists.linux.org.uk

On Tue, Aug 15, 2006 at 11:38:24PM +0200, Rafał Bilski wrote:
 > Rename option "dont_scale_voltage" to "scale_voltage" because 
 > don't will be default.
 > Use "pos" for calculating voltage. In this way driver don't need 
 > to know mV value or low level value. Simply min U is one pos and 
 > max U is second pos. All pos between these two are used.
 > Assume that min U is for min f and max U for max f. For frequency 
 > between min and max calculate pos based on difference between 
 > current frequency and min f.
 > 
 > Signed-off-by: Rafał Bilski <rafalbilski@interia.pl>

Looks ok (small CodingStyle nits mentioned below).
Can you fix those up and send both patches as one ?
If I apply them independantly and someone searching for a bug
with git bisect lands in the middle of the two patches, they'll
have a tree that doesn't compile, which isn't nice.


 > +static unsigned int highest_speed, lowest_speed; /* kHz */
 >  static unsigned int minmult, maxmult;
 > -static int can_scale_voltage;
 > -static int vrmrev;
 > +static int can_scale_voltage = 0;

=0 is unneeded for static vars.

 > -static int dont_scale_voltage;
 > +static int scale_voltage = 0;
 >  static int ignore_latency = 0;

ditto. (Feel free to fix up ignore_latency too).

 > @@ -454,53 +465,62 @@ static int __init longhaul_get_ranges(vo
 >  static void __init longhaul_setup_voltagescaling(void)
 >  {
 >  	union msr_longhaul longhaul;
 > +	struct mV_pos minvid,
 > +		      maxvid;
 > +	unsigned int j,
 > +		     speed,
 > +		     pos,
 > +		     kHz_step,
 > +		     numvscales;

Either keep them on one line, or prepend unsigned int to all of them.
Doing it the way you did it is annoying when you're grepping for a type.

 > -	if (!(longhaul.bits.RevisionID & 1))
 > +	rdmsrl(MSR_VIA_LONGHAUL, longhaul.val);
 > +	if ( !(longhaul.bits.RevisionID & 1) ) {

The extra spaces contravene CodingStyle. It was right before.

There also seemed to be some whitespace (using spaces instead of tabs?)
problems in the longhaul.h diff, so give that a quick doublecheck too.

Other than these minor nits, looks good.
What CPUs have you tested this on so far btw ?

		Dave

-- 
http://www.codemonkey.org.uk
