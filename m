From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [RFC] cpufreqtools
Date: Tue, 26 Oct 2004 21:57:12 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041026195712.GA678@dominikbrodowski.de>
References: <20041021172227.GA24663@dominikbrodowski.de>
	<20041022143927.GE22405@poupinou.org>
	<20041022145738.GA2136@dominikbrodowski.de>
	<20041022172109.GF22405@poupinou.org>
	<1098635425.4442.1.camel@localhost>
	<pan.2004.10.25.10.07.03.511563@yahoo.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <pan.2004.10.25.10.07.03.511563@yahoo.com>
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
To: Paul Ionescu <i_p_a_u_l@yahoo.com>
Cc: cpufreq@www.linux.org.uk

On Mon, Oct 25, 2004 at 01:07:05PM +0300, Paul Ionescu wrote:
> Hi Jeremy,
> 
> I think too that dbus is the way to go.
> If there is not any big issue with dbus, we should use it for uniformity.
> Why invent a new protocol for this if not really necessary ?
> Consistent UI/policy tools is a nice thing to have.

I'd like to keep a "low-overhead" support by the C calls to libcpufreq,
especially for the embedded area [I'm thinking especially of Johan
Pouwelse's work]. A daemon, which may both accept a socket or dbus input,
depending on configuration, can then be added on top of it. And as such I'd
prefer to get a first revision of the cpufreqtools out soon, and add the
daemon and dbus support later on. Patches will be _very_ welcome then.

Thanks,
	Dominik
