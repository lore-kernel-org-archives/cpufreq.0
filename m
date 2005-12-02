From: Felix Braun <Felix.Braun@mail.mcgill.ca>
Subject: Re: [PATCH 2.6.14] cpufreq: don't suggest speedstep-centrino for
 Dothan-based Celeron-M processors
Date: Fri, 2 Dec 2005 20:29:10 +0100
Message-ID: <20051202202910.07220354@tilion.getrex.org>
References: <88056F38E9E48644A0F562A38C64FB60067F3CAD@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60067F3CAD@scsmsx403.amr.corp.intel.com>
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
Content-Type: text/plain; charset="us-ascii"
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: CPUFreq@lists.linux.org.uk, Bruno Ducrot <ducrot@poupinou.org>, Dominik Brodowski <linux@dominikbrodowski.net>, davej@redhat.com

On Fri, 02 Dec 2005 08:58:12 -0800 "Pallipadi, Venkatesh"
<venkatesh.pallipadi@intel.com> wrote:


> For short term though, atleast there need to be some big Red flag
> against using p4-clockmod for powersave purposes. Having that info in CONFIG
> help doesn't seem to be working.

I didn't see any such information in CONFIG_HELP. Still, I'm happy to use
it for thermal management too :-)

Bye
Felix
