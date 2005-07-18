From: Ian Campbell <icampbell@arcom.com>
Subject: Re: [PATCH] CPUFreq Support for PXA255
Date: Mon, 18 Jul 2005 16:06:20 +0100
Message-ID: <1121699180.3519.37.camel@icampbell-debian>
References: <1121341256.10537.12.camel@icampbell-debian>
	<20050715164115.GA3240@isilmar.linta.de>
	<1121684526.4215.25.camel@icampbell-debian>
	<20050718120112.GA4270@isilmar.linta.de>
	<1121688683.4215.39.camel@icampbell-debian>
	<1121697094.3519.27.camel@icampbell-debian>
	<20050718150307.GA8202@isilmar.linta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20050718150307.GA8202@isilmar.linta.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk

On Mon, 2005-07-18 at 17:03 +0200, Dominik Brodowski wrote:
> >         	ret = cpufreq_governor(policy->cpu, CPUFREQ_GOV_START);

> No. Just call 
> 		cpufreq_update_policy(policy->cpu);
> instead.

Thanks -- don't know how I missed that one.

Ian.

-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road,                    Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom       Phone:  +44 (0)1223 411 200


_____________________________________________________________________
The message in this transmission is sent in confidence for the attention of the addressee only and should not be disclosed to any other party. Unauthorised recipients are requested to preserve this confidentiality. Please advise the sender if the addressee is not resident at the receiving end.  Email to and from Arcom is automatically monitored for operational and lawful business reasons.

This message has been virus scanned by MessageLabs.
