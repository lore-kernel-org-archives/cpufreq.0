From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: my dothan didn't work with cpufreq...
Date: Sat, 24 Jul 2004 09:06:35 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040724070635.GA8898@dominikbrodowski.de>
References: <40F2FA8B.10307@lifl.fr>
	<20040713094937.GB8124@dominikbrodowski.de>
	<1090461320.13505.3.camel@localhost>
	<20040722060437.GA8888@dominikbrodowski.de>
	<1090479407.4351.6.camel@localhost>
	<20040722093126.GA8418@dominikbrodowski.de>
	<1090517665.5267.9.camel@ixodes.goop.org>
	<20040723193859.GC8441@dominikbrodowski.de>
	<1090632444.2950.1.camel@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1090632444.2950.1.camel@localhost>
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
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: cpufreq list <cpufreq@www.linux.org.uk>

On Fri, Jul 23, 2004 at 06:27:24PM -0700, Jeremy Fitzhardinge wrote:
> On Fri, 2004-07-23 at 21:38 +0200, Dominik Brodowski wrote: 
> > Again IIRC, it's less about CodingStyle and more about some GCC 3.?
> > warnings? Though, gcc 3.3.4 doesn't complain...
> 
> You mean the "[idx] = " syntax?

No, the
	{ value, value, ... }
instead of
	{ .field = value, .field = value, ... }
syntax. 

	Dominik
