From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH 2.6.8-rc2] speedstep SMT support
Date: Thu, 29 Jul 2004 18:34:50 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040729163450.GA7947@dominikbrodowski.de>
References: <4107B8DE.5020401@cern.ch>
	<20040728172028.GB8678@dominikbrodowski.de>
	<4108EB34.9060505@cern.ch>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4108EB34.9060505@cern.ch>
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
To: holbling@cpt.univ-mrs.fr
Cc: cpufreq@www.linux.org.uk

On Thu, Jul 29, 2004 at 12:19:00PM +0000, Christian Hoelbling wrote:
>  hi and thanks alot for your comments!
You're welcome -- and thanks for your contributions.

>  i will gladly do. however, i am a bit afraid of missing some patch - 
> could you send me a diff of your source tree to a recent vanilla source 
> so i know where to start from? or is there some repository somewhere 
> that i don't know about where the cpufreq development sources are kept?
The current[*] diff between what's in Linus' tree and what's in the "cpufreq
development sources" a.k.a. cpufreq-bk is available at
http://www.codemonkey.org.uk/projects/bitkeeper/cpufreq/

Without cc'ing this list I'll provide you with a cpufreq-updates-since-2.6.7
diff in just a moment...

	Dominik

[*] updated daily... so an offset of 23:59 is possible...
