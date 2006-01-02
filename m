From: Andi Kleen <ak@suse.de>
Subject: Re: cpufreq: powernow-k8 frequency transitions question
Date: 02 Jan 2006 18:15:30 +0100
Message-ID: <p73fyo6ft59.fsf@verdi.suse.de>
References: <dp8h08$du6$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <dp8h08$du6$1@sea.gmane.org>
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
Content-Transfer-Encoding: 7bit
To: Gunter Ohrner <G.Ohrner@post.rwth-aachen.de>
Cc: cpufreq@lists.linux.org.uk

Gunter Ohrner <G.Ohrner@post.rwth-aachen.de> writes:

> I already asked this question on linux-kernel@vger.kernel.org but maybe this
> list would be a more appropriate place...

The proceedings of the Ottawa Linux Symposium 2004 (available online) 
have a detailed paper on the powernow-k8 driver.

> I'm currently reading and playing with the powernow-k8 cpufreq driver
> module. However so far I wasn't able to find out how frequency transitions
> are dealt with that have to be made using intermediate steps, ie.
> transitions which cannot be done in one single step.
> 
> (I read about this at 
> http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/26094.PDF
> p. 269f.)
> 
> I found safety guards which return an error if an invalid frequency
> transition ("lo-lo transition") is requested. Is this the only support for
> these transitions currently implemented or did I miss something?
> Is there more advanced support simply missing, or is the current behaviour
> sufficient, and if yes, why does this suffice?
> 
> How do the conservative/ondemand cpufreq governors cope with the kernel
> advertising frequencies it cannot directly transition between?

Step by step. The frequency/voltage transistion functions 
in powernow-k8.c go through them in loops.

-Andi
