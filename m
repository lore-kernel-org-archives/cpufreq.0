From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: my dothan didn't work with cpufreq...
Date: Wed, 21 Jul 2004 18:55:20 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1090461320.13505.3.camel@localhost>
References: <40F2FA8B.10307@lifl.fr>
	<20040713094937.GB8124@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040713094937.GB8124@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk

On Tue, 2004-07-13 at 11:49 +0200, Dominik Brodowski wrote:
> Maybe. The frequency/voltage pairs for Dothans are different to those of
> Banias. A built-in table isn't possible for Dothans, IIRC, as even if you 
> know the CPUID you can't know for 100% which pairs are valid -- it depends
> on some other info not in the CPUID.

I've been meaning to look into this to see if there's some way to add a
table method.  It's moderately tricky because there's two steppings of
Dothan, and the specs are not obvious to me (they seem to list 4
voltages per frequency point, which is confusing).

Anyway, I have a good collection of /proc/cpuinfos now, so I can pick
through them to see what common elements there are.

I guess it would also be good to get dumps from the ACPI tables.  What's
the best way to do that?

[ And for those who've mailed me and got nothing back - I'm sorry about
that.  I have been getting a lot of reports - people seem to be buying a
lot of laptops... ]

	J
