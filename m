From: Mattia Dongili <dongili@supereva.it>
Subject: Re: Problem with ondemand on Athlon
Date: Wed, 5 Nov 2003 15:57:52 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031105145752.GB928@inferi.kami.home>
References: <200310310434.01311.thierry.lathuille2@libertysurf.fr>
	<20031104181227.GA4326@brodo.de>
Reply-To: dongili@supereva.it
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031104181227.GA4326@brodo.de>
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
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@www.linux.org.uk

On Tue, Nov 04, 2003 at 07:12:27PM +0100, Dominik Brodowski wrote:
> Unfortunately, I can't reproduce the problem locally on my p4.
> Can both of you try out the following, please:
> 
> pass "clock=pit" as a command line argument
> 
> The p4-clockmod driver [currently] needs to be built as a module then, 
> and you need to pass stock_freq as an argument then. AFAIK, no such
> requirement exists for powernow-k7.

ok, I hope I can do it this evening

bye
-- 
mattia
:wq!
