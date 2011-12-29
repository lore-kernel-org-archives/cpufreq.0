From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH]resubmit: add a generic clk based cpufreq
 driver
Date: Thu, 29 Dec 2011 01:51:10 +0000
Message-ID: <20111229015110.GA4839@sirena.org.uk>
References: <4EE8DD58.8030804@calxeda.com>
 <4EFA31BD.8020007@calxeda.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4EFA31BD.8020007@calxeda.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Langsdorf <mark.langsdorf@calxeda.com>
Cc: "davej@redhat.com" <davej@redhat.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On Tue, Dec 27, 2011 at 02:59:41PM -0600, Mark Langsdorf wrote:

> Resubmitting with Jamie's permission. We at Calxeda would like to use
> this framework for our Highbank SoC and would like to get it upstream.
> 
> There are a few potential issues to be resolved here so any feedback
> would be much appreciated.  In particular, Jamie is not sure how best
> to document the bindings as there isn't a compatible property.
> Related to this is the initialisation; at the moment the platform is
> required to call generic_clk_cpufreq_init() as Jamie couldn't think
> of a sensible way to do this automatically without lots of machine
> compatibility tests.
> 
> The final one is the transition latency and how to get that from the
> DT.  The most logical place is in the clock node and parse the phandle
> of the clock from the cpu node then read something like a transition-
> latency property, but Jamie is not sure if that's best.

Please take a look at the patch series Richard Zhao has been working on
enthusiastically, I'm not sure what the relationship is between the two
(if Richard started from the same place or if he wrote from scratch) but
it does exactly the same thing.
