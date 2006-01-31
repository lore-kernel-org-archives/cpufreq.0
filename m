From: Mattia Dongili <malattia@linux.it>
Subject: Re: Temperature Limiting Govenor?
Date: Tue, 31 Jan 2006 19:31:48 +0100
Message-ID: <20060131183148.GH4084@inferi.kami.home>
References: <43DF319D.2010105@chrestomanci.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <43DF319D.2010105@chrestomanci.org>
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
To: David Pottage <david@chrestomanci.org>
Cc: cpufreq@www.linux.org.uk

On Tue, Jan 31, 2006 at 09:45:01AM +0000, David Pottage wrote:
> Hi.
> 
> I have an AMD64 system, that will tend to heat up hotter than I would 
> prefer if it is run at the maximum clock speed, especialy in summer.
> 
> In order to prolong the life of the CPU, and other components in my 
> case, I have written a simple user space governor in perl, that 
> dynamically limits the maximum clock speed to prevent CPU overheat, 
> while allowing short busts at full speed.
> 
> On my system this allows me busts of high CPU speed for good interactive 
> performance, while preventing long running processes such as media 
> encoding from causing exesively high temperatures.

Just for the record: cpufreqd does support both ACPI temp and sensors
monitoring :)

> Would it be worthwhile incorporating similar functionality into a kernel 
> space governor? How easy would it be to do? Is it possible for more than 
> one governor to be active at once?

no, it's not possible currently. I don't know if I would want such a
governor, on my laptop I still prefer to have the ondemand governor
buond to limits collected in userspace :) (I suppose you were asking for
more the one governor active for exactly the same reason).

bye
-- 
mattia
:wq!
