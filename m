From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: [discuss] Re: [PATCH] Allow all Opteron processors to change
	pstate at same time
Date: Tue, 11 Jul 2006 18:01:23 +0200
Message-ID: <1152633683.3128.84.camel@laptopd505.fenrus.org>
References: <Pine.LNX.4.64.0607061519040.9066@solonow.amd.com>
	<p73fyhdpqe1.fsf@verdi.suse.de> <1152622554.4489.32.camel@lapdog.site>
	<200607111507.39079.ak@suse.de>
	<1152623675.3128.41.camel@laptopd505.fenrus.org>
	<1152634538.18028.23.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1152634538.18028.23.camel@localhost.localdomain>
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
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: discuss@x86-64.org, cpufreq@lists.linux.org.uk, Andi Kleen <ak@suse.de>, linux-kernel@vger.kernel.org

On Tue, 2006-07-11 at 17:15 +0100, Alan Cox wrote:
> Ar Maw, 2006-07-11 am 15:14 +0200, ysgrifennodd Arjan van de Ven:
> > if you have per cpu offset and speed, then you don't even need to tie
> > all frequencies together... sounds like the best solution to me..
> 
> CPU clocks on some systems are not stable relative to one another. Doing
> the maths only works if you know the divergence isn't cause by
> independant clock sources

obviously you do math only on your local cpu, with the values for your
local cpu. And just never ever look at tsc values from another cpu,
consider them entirely uncorrelated for all I care ;)

Within those constraints it should be reasonably ok (there still is trouble 
if the tsc stops entirely in idle, but thats a different thing)
