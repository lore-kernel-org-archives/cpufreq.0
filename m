From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: default ondemand governor
Date: Fri, 7 Jan 2005 18:04:48 +0100
Message-ID: <20050107170448.GA8343@dominikbrodowski.de>
References: <20050107163331.GE9999@wotan.suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050107163331.GE9999@wotan.suse.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: cpufreq@www.linux.org.uk

On Fri, Jan 07, 2005 at 05:33:31PM +0100, Andi Kleen wrote:
> 
> Is there any specific reason the ondemand governor cannot be made
> default in .config ? 

Yes. It can fail on startup, and then there's no other governor to fall back
to. It's in my TODO queue, hopefully a patch which will sanitize this will
be available soon.

	Dominik
