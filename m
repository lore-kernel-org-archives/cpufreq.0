From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] cpufreq support for 7447A on 2004 iBooks
Date: Sat, 05 Jun 2004 11:21:14 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1086452473.12664.36.camel@gaston>
References: <200406051846.50718.toojays@toojays.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <200406051846.50718.toojays@toojays.net>
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
To: John Steele Scott <toojays@toojays.net>
Cc: linuxppc-dev list <linuxppc-dev@lists.linuxppc.org>, Christiaan Welvaart <cjw@daneel.dyndns.org>, cpufreq@www.linux.org.uk

On Sat, 2004-06-05 at 04:15, John Steele Scott wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Okay, thanks to some tips from Benjamin Herrenschmidt, I now have a patch 
> against 2.6.6 which lets you control dynamic frequency scaling on the latest 
> model iBook G4. I imagine that this same method would apply to the new 
> PowerBooks as well.

I suggest you also look at the latest Darwin code Apple released, more
sepecifically AppleMacRISC2PE. There is some new bits including something
about tweaking a bus delay when changing the frequency on these models.

Ben.
