From: Christian Hoelbling <christian.holbling@cern.ch>
Subject: Re: [PATCH 2.6.8-rc2] speedstep SMT support
Date: Thu, 29 Jul 2004 12:19:00 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <4108EB34.9060505@cern.ch>
References: <4107B8DE.5020401@cern.ch>
	<20040728172028.GB8678@dominikbrodowski.de>
Reply-To: holbling@cpt.univ-mrs.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040728172028.GB8678@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk

  hi and thanks alot for your comments!

Dominik Brodowski wrote:

>
>This I'd prefer not to be merged: 
>a) CONFIG_SMP doesn't mean cpu_sibling_map exist, e.g. on non-x86 architectures
>b) it "emulates" sibling-awareness, though the governors are not.
>  
>
 agree on both of these

>Instead, I'd prefer if we keep up with the "only-register-one-CPU" in the
>speedstep-ich case until a proper SMT patchkit is applied.
>
>However, for the other changes: could you consider my opinions, maybe update it
>and resend it, please? 
>
>  
>
  i will gladly do. however, i am a bit afraid of missing some patch - 
could you send me a diff of your source tree to a recent vanilla source 
so i know where to start from? or is there some repository somewhere 
that i don't know about where the cpufreq development sources are kept?

 thanks alot,

chris
