From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: PXA cpufreq support
Date: Wed, 21 Apr 2004 16:58:34 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040421145834.GA7389@dominikbrodowski.de>
References: <Pine.LNX.4.58.0404192220000.2250@montezuma.fsmlabs.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1121923984=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <Pine.LNX.4.58.0404192220000.2250@montezuma.fsmlabs.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Zwane Mwaikambo <zwane@arm.linux.org.uk>
Cc: Dave Jones <davej@redhat.com>, Holger Schurig <h.schurig@mn-logistik.de>, CPU Freq ML <cpufreq@www.linux.org.uk>


--===============1121923984==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 20, 2004 at 11:37:05PM -0400, Zwane Mwaikambo wrote:
> -if (CPU_FREQ_INTEGRATOR) || (CPU_FREQ_SA1110) || (CPU_FREQ_SA1100)
> +config CPU_FREQ_PXA
> +	bool
> +	depends on CPU_FREQ && ARCH_PXA
> +	default y
> +	select CPU_FREQ_DEFAULT_GOV_USERSPACE
> +	select CPU_FREQ_24_API if SYSCTL
> +
> +if (CPU_FREQ_INTEGRATOR) || (CPU_FREQ_SA1110) || (CPU_FREQ_SA1100) || (CPU_FREQ_PXA)

No. The userspace and 24_api override are _only_ for sa11x0 as they used
this interface in 2.4. -- all other drivers and all newly merged drivers
should not select such things. Instead just include drivers/cpufreq/Kconfig
and give the users the choice. Also, AFAICS it can become a tristate [as
long as all necessary symbols are exported elsewhere].

> +static unsigned int freq_debug = DEBUG;
> +MODULE_PARM(freq_debug, "i");
> +MODULE_PARM_DESC(freq_debug, "Set the debug messages to on=1/off=0");

Please use module_param instead. MODULE_PARM is sort of deprecated, AFAICS.
You won't be able to use MODULE_PARM even, as config CPU_FREQ_PXA is only a
bool ATM -- with module_param, you can pass the argument on the boot line
instead :-)

> +typedef struct {
> +	unsigned int khz;
> +	unsigned int membus;
> +	unsigned int cccr;
> +	unsigned int div2;
> +} pxa_freqs_t;

No unnecessary typedefs, please.

> +/* Use the run mode frequencies for the CPUFREQ_POLICY_PERFORMANCE policy */
> +static pxa_freqs_t pxa255_run_freqs[] = {
> +	/* CPU   MEMBUS  CCCR  DIV2 */
> +	{99500, 99500, 0x121, 1},	/* run= 99, turbo= 99, PXbus=50,  SDRAM=50 */
> +	{132700, 132700, 0x123, 1},	/* run=133, turbo=133, PXbus=66,  SDRAM=66 */
> +	{199100, 99500, 0x141, 0},	/* run=199, turbo=199, PXbus=99,  SDRAM=99 */
> +	{265400, 132700, 0x143, 1},	/* run=265, turbo=265, PXbus=133, SDRAM=66 */
> +	{331800, 165900, 0x145, 1},	/* run=331, turbo=331, PXbus=166, SDRAM=83 */
> +	{398100, 99500, 0x161, 0},	/* run=398, turbo=398, PXbus=196, SDRAM=99 */
> +	{0,}
> +};
> +
> +#define NUM_RUN_FREQS (sizeof(pxa255_run_freqs)/sizeof(pxa_freqs_t))
> +
> +static struct cpufreq_frequency_table pxa255_run_freq_table[NUM_RUN_FREQS +
> +							    1];
> +
> +/* Use the turbo mode frequencies for the CPUFREQ_POLICY_POWERSAVE policy */
> +static pxa_freqs_t pxa255_turbo_freqs[] = {
> +	/* CPU   MEMBUS  CCCR  DIV2 */
> +	{99500, 99500, 0x121, 1},	/* run=99,  turbo= 99, PXbus=50, SDRAM=50 */
> +	{199100, 99500, 0x221, 0},	/* run=99,  turbo=199, PXbus=50, SDRAM=99 */
> +	{298500, 99500, 0x321, 0},	/* run=99,  turbo=287, PXbus=50, SDRAM=99 */
> +	{298600, 99500, 0x1c1, 0},	/* run=199, turbo=287, PXbus=99, SDRAM=99 */
> +	{398100, 99500, 0x241, 0},	/* run=199, turbo=398, PXbus=99, SDRAM=99 */
> +	{0,}
> +};
> +
> +#define NUM_TURBO_FREQS (sizeof(pxa255_turbo_freqs)/sizeof(pxa_freqs_t))
> +
> +static struct cpufreq_frequency_table pxa255_turbo_freq_table[NUM_TURBO_FREQS + 1];

Hm, I don't really understand this bit: does the PXA support two different
modes ("turbo" and "run"), and each mode has different possible frequencies?
Or what is this about.


> +	if (policy->policy == CPUFREQ_POLICY_PERFORMANCE) {
> +		pxa_freqs_table = pxa255_run_freq_table;
> +	} else if (policy->policy == CPUFREQ_POLICY_POWERSAVE) {
> +		pxa_freqs_table = pxa255_turbo_freq_table;
> +	} else {

This won't work, AFAICS. policy->policy is in an undefined state, as this is
a "target" CPUfreq driver.

> +	if (policy->policy == CPUFREQ_POLICY_PERFORMANCE) {
> +		pxa_freq_settings = pxa255_run_freqs;
> +		pxa_freqs_table = pxa255_run_freq_table;
> +	} else if (policy->policy == CPUFREQ_POLICY_POWERSAVE) {
> +		pxa_freq_settings = pxa255_turbo_freqs;
> +		pxa_freqs_table = pxa255_turbo_freq_table;

Same here.

> +	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
> +
> +	/* Calculate the next MDREFR.  If we're slowing down the SDRAM clock
> +	 * we need to preset the smaller DRI before the change.  If we're speeding
> +	 * up we need to set the larger DRI value after the change.
> +	 */
> +	preset_mdrefr = postset_mdrefr = MDREFR;
> +	if ((MDREFR & MDREFR_DRI_MASK) > MDREFR_DRI(pxa_freq_settings[idx].membus)) {
> +		preset_mdrefr = (preset_mdrefr & ~MDREFR_DRI_MASK) |
> +				MDREFR_DRI(pxa_freq_settings[idx].membus);
> +	}
> +	postset_mdrefr = (postset_mdrefr & ~MDREFR_DRI_MASK) |
> +			 MDREFR_DRI(pxa_freq_settings[idx].membus);
> +
> +	/* If we're dividing the memory clock by two for the SDRAM clock, this
> +	 * must be set prior to the change.  Clearing the divide must be done
> +	 * after the change.
> +	 */
> +	if (pxa_freq_settings[idx].div2) {
> +		preset_mdrefr |= MDREFR_DB2_MASK;
> +		postset_mdrefr |= MDREFR_DB2_MASK;
> +	} else {
> +		postset_mdrefr &= ~MDREFR_DB2_MASK;
> +	}

Can you do the notify_transition call here? It should be _as close as
possible_ to the actual transition.

> +static int pxa_cpufreq_init(struct cpufreq_policy *policy)
> +{
> +	cpumask_t cpus_allowed;
> +	unsigned int cpu = policy->cpu;
> +	int i;
> +
> +	cpus_allowed = current->cpus_allowed;
> +
> +	set_cpus_allowed(current, cpumask_of_cpu(cpu));
> +
> +	/* set default policy and cpuinfo */
> +	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
> +	policy->policy = CPUFREQ_POLICY_PERFORMANCE;

As policy->policy is undefined on ->target governors, please do not set it.

> +static struct cpufreq_driver pxa_cpufreq_driver = {
> +	.verify = pxa_verify_policy,
> +	.target = pxa_set_target,
> +	.init = pxa_cpufreq_init,
> +	.name = "PXA25x",
> +};
.owner is missing.


	Dominik

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAhowaZ8MDCHJbN8YRArYBAKCRrEGkurULcy+Grh56v85Vv9qv5ACfWXx/
HKdQ399qyhdEFU54Yxr7Dqw=
=wHzs
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--


--===============1121923984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1121923984==--

