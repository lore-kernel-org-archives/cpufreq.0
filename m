From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: add new p3m model
Date: Mon, 8 Mar 2004 14:31:35 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040308133135.GU2869@poupinou.org>
References: <20040308111531.GD14593@devserv.devel.redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040308111531.GD14593@devserv.devel.redhat.com>
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
To: Arjan van de Ven <arjanv@redhat.com>
Cc: cpufreq@www.linux.org.uk

On Mon, Mar 08, 2004 at 12:15:31PM +0100, Arjan van de Ven wrote:
> Hi,
> 
> the patch below adds support for my laptop (Dell Inspiron 2600) which has
> ebx return 7 for the p3 mobile in it....
> 

Sorry, I checked documentations (AN, pentium III mobile specs updates at
dec. 2003, PIII specs update, etc.), but found nothing.
Since there is no processor that will return 7 for the brand id, I deduce
that your processor do not exist at all because Intel can not make
mistake, isn't it?

Hem, at least, since anyway that do not hurt the case for desktops or
servers PIII tualatins processors (hopefully, those should return
only 2 or 4, but who knows, after all), then I guess we can
accept your patch even if this processor do not exist.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
