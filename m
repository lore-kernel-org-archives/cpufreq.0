From: Len Brown <lenb@kernel.org>
Subject: Re: ondemand: cpu load calculation with kernel processus
Date: Thu, 31 May 2007 20:57:45 -0400
Message-ID: <200705312057.45963.lenb@kernel.org>
References: <20070531165744.4bf6e18b@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20070531165744.4bf6e18b@localhost.localdomain>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

On Thursday 31 May 2007 17:57, Nicolas Capit wrote:
> Hello,
> 
> I am running a Debian unstable with a kernel 2.6.21-1-686 and using
> modules powernow_k8 and cpufreq_ondemand.
> 
> My configuration with the ondemand governor seems to work very well
> except when my cpu is busy by the kernel processus kcryptd. The cpu is
> 100% busy but the frequency is not increased.
> (I am using the module dm_crypt to encrypt my home filesystem)
> 
> So my question is:
> Does the ondemand governor calculate the load of the machine with user
> level and *kernel* level processus?

both user and kernel time should count as busy time.

do the cpu stats exposed by top show that you have idle time available?

-Len
