From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Desktop with DVS
Date: Mon, 29 Mar 2004 15:50:54 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040329135054.GJ19001@poupinou.org>
References: <8825450.1079962608@d-128-74-92.bootp.Virginia.EDU>
	<20040322201733.GA9780@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040322201733.GA9780@dominikbrodowski.de>
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
To: Zhijian Lu <zl4j@cms.mail.virginia.edu>, cpufreq@www.linux.org.uk

On Mon, Mar 22, 2004 at 09:17:33PM +0100, Dominik Brodowski wrote:
> On Mon, Mar 22, 2004 at 01:36:48PM -0500, Zhijian Lu wrote:
> > Hello,
> > 
> > This may be off the loop. But does anyone know if there are 
> > any desktop computers with dynamic voltage scaling capacity?
> 
> For x86{,_64}: AFAIK there are several choices: 
> - some x86_64 AMD [server] processors and mainboards support 
>   voltage scaling,

That is not reserved to server.  Most modern UP desktops shipped with AMD64 
do have what is called now 'cool'n quiet' technology, and should be supported
by the powernow-k8 driver (you have to be sure that itt's enabled, though.
Some northbridges do not allow this unfortunatelly, even though the processor
is capable of that).

> - there are some special mainboards which support Intel Pentium M processors
> - the transmeta efficeon CPU supports dynamic voltage scaling without
>   any operating system interaction
> - maybe some others (VIA) which I've missed.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
