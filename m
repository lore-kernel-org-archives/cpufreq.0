From: Mattia Dongili <dongili@supereva.it>
Subject: Re: Problem with ondemand on Athlon
Date: Tue, 11 Nov 2003 10:51:43 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031111095143.GC930@inferi.kami.home>
References: <20031105182110.GA922@inferi.kami.home>
	<20031110205912.GB7149@brodo.de>
Reply-To: dongili@supereva.it
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031110205912.GB7149@brodo.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

On Mon, Nov 10, 2003 at 09:59:12PM +0100, Dominik Brodowski wrote:
> This is really strange... will provide a DEBUG()-printk patch soon, would be
> great if you could test it then...

of course I can. In the meantime if you can tell a couple of interesting
functions and variables, I could add some printk-s by myself (if I get
some spare time before you do)

[...]
> > > pass "clock=pit" as a command line argument
> > 
> > this semms not to be a valid argument here
> 
> ? clock=pit specifies that the PIT should be used instead of the TSC as
> timing source... so it should be a valid boot argument.

sorry... my bad. I used it as a p4_clockmod argument and did not
bothered to check Documentation/kernel-parameters.txt

I'll re-test it as soon as possible.

bye
-- 
mattia
:wq!
