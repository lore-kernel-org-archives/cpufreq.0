From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] cpufreq_(ondemand|conservative)
Date: Sat, 29 Jan 2005 21:09:16 +0100
Message-ID: <20050129200916.GB9542@dominikbrodowski.de>
References: <20050123150000.GA3888@inskipp>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050123150000.GA3888@inskipp>
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
To: Alexander Clouter <alex@digriz.org.uk>, davej@redhat.com
Cc: cpufreq@lists.linux.org.uk

Hi,

On Sun, Jan 23, 2005 at 03:00:01PM +0000, Alexander Clouter wrote:
> 1) cpufreq_ondemand-2.6.11-rc1-mm1-01_ignore-nice.diff
Please see other mail

> 4) cpufreq_ondemand-2.6.11-rc1-mm1-04_ignore_steal.diff
> 	I noticed a new cpustat has appeared called 'steal'[2] which from 
> 	what I can tell should be treated like an iowait stat.  'steal' only 
> 	seems supported by S/390 but I think it should be 'considered'.  This 
> 	is a minor patch and if I have gotten confused then obviously it 
> 	should be removed (and from cpufreq_conservative)

As there's no cpufreq support for S/390 (yet?), I don't see a need for
applying this.

Other patches look fine. If Venki agrees: could you re-send them (1 updated,
2,3,5 and conservative) to the cpufreq list and Dave Jones <davej@redhat.com> 
(one patch per e-mail, Signed-off-by: line included)? IMHO they're ready for 
"upstream".

Many thanks,
	Dominik
