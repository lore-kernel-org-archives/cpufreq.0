From: Drew Varner <drew.varner@redops.org>
Subject: Re: Desktop with DVS
Date: Tue, 06 Apr 2004 19:42:14 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1081294933.1912.15.camel@localhost.localdomain>
References: <8825450.1079962608@d-128-74-92.bootp.Virginia.EDU>
	<20040322201733.GA9780@dominikbrodowski.de>
	<20040329135054.GJ19001@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040329135054.GJ19001@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

Can someone point me to a specific AMD64 desktop that they've gotten to
work with cpufreq (i.e. one with a suitable northbridge)? I'd like to
purchase a cpufreq-savvy desktop.

- Drew

On Mon, 2004-03-29 at 08:50, Bruno Ducrot wrote:
> On Mon, Mar 22, 2004 at 09:17:33PM +0100, Dominik Brodowski wrote:
> > On Mon, Mar 22, 2004 at 01:36:48PM -0500, Zhijian Lu wrote:
> > > Hello,
> > > 
> > > This may be off the loop. But does anyone know if there are 
> > > any desktop computers with dynamic voltage scaling capacity?
> > 
> > For x86{,_64}: AFAIK there are several choices: 
> > - some x86_64 AMD [server] processors and mainboards support 
> >   voltage scaling,
> 
> That is not reserved to server.  Most modern UP desktops shipped with AMD64 
> do have what is called now 'cool'n quiet' technology, and should be supported
> by the powernow-k8 driver (you have to be sure that itt's enabled, though.
> Some northbridges do not allow this unfortunatelly, even though the processor
> is capable of that).
> 
> > - there are some special mainboards which support Intel Pentium M processors
> > - the transmeta efficeon CPU supports dynamic voltage scaling without
> >   any operating system interaction
> > - maybe some others (VIA) which I've missed.
