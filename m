From: Stefan Seyfried <seife@gmane0305.slipkontur.de>
Subject: Re: scaling_max_freq == scaling_min_freq when on battery
Date: Tue, 24 May 2005 20:52:28 +0200
Message-ID: <20050524185228.GB29280@message-id.gmane0305.slipkontur.de>
References: <88056F38E9E48644A0F562A38C64FB6004CB340B@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6004CB340B@scsmsx403.amr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

On Mon, May 23, 2005 at 01:06:45PM -0700, Pallipadi, Venkatesh wrote:
> 
> This limitation must be coming from BIOS. It seems BIOS has decided not 
> to let CPU run at higher than 600MHz when on battery. 

But i have seen this on a Dell D600 too; although if i manually echoed
1700000 into scaling_max_freq, it could go up even on battery. Also,
if i suspended on battery and resumed, i could never get it to go
higher than 600MHz again, even on AC. This was a bit mysterious:
it happened more often on "userspace" governor than when i suspended on
"performance" governor and was not too easy to reproduce; now i have
switched machines and the ASUS M6ne doesn't show this behaviour.

If i find a way to reproduce it reliably (it is probably just a matter
of writing down the steps), i'll post a bugreport.
-- 
Stefan Seyfried
