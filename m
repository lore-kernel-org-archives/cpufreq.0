From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [2.6.9-rc2] ondemand governor not working
Date: Fri, 17 Sep 2004 21:10:35 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040917191035.GA8529@dominikbrodowski.de>
References: <88056F38E9E48644A0F562A38C64FB6002E1C76C@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6002E1C76C@scsmsx403.amr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>, davej@redhat.com
Cc: cpufreq@www.linux.org.uk

On Wed, Sep 15, 2004 at 03:33:04PM -0700, Pallipadi, Venkatesh wrote:
> >Back to the original problem, powernow-k7 is setting transition_latency
> >to 1ns, is it sensible?
> 
> Not sure. I don't have enough expertise in powernow-k7 :).

AFAICS, a multiplication with 1000 is missing somewhere in powernow-k7. Need
Davej's insight on this, though.

	Dominik
