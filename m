From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: starting governor ondemand failed
Date: Mon, 4 Apr 2005 18:58:10 +0200
Message-ID: <20050404165810.GQ2298@poupinou.org>
References: <88056F38E9E48644A0F562A38C64FB60046298FE@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60046298FE@scsmsx403.amr.corp.intel.com>
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
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@ZenII.linux.org.uk, Dominik Brodowski <linux@dominikbrodowski.net>

On Mon, Apr 04, 2005 at 06:39:52AM -0700, Pallipadi, Venkatesh wrote:
> 
> 
> Dominik,
> 
> Can we do some calibration of the time taken to switch frequencies
> at the time of initialization and use it here instead of hardcoding 
> it to CPUFREQ_ETERNAL? 
> 

What we want is worst case...

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
