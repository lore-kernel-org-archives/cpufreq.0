From: Paul Ionescu <i_p_a_u_l@yahoo.com>
Subject: Re: [RFC] cpufreqtools
Date: Mon, 25 Oct 2004 13:07:05 +0300
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <pan.2004.10.25.10.07.03.511563@yahoo.com>
References: <20041021172227.GA24663@dominikbrodowski.de>
	<20041022143927.GE22405@poupinou.org>
	<20041022145738.GA2136@dominikbrodowski.de>
	<20041022172109.GF22405@poupinou.org>
	<1098635425.4442.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
To: cpufreq@www.linux.org.uk

Hi Jeremy,

I think too that dbus is the way to go.
If there is not any big issue with dbus, we should use it for uniformity.
Why invent a new protocol for this if not really necessary ?
Consistent UI/policy tools is a nice thing to have.

On Sun, 24 Oct 2004 18:30:25 +0200, Jeremy Fitzhardinge wrote:

> On Fri, 2004-10-22 at 19:21 +0200, Bruno Ducrot wrote:
>> I do like Jeremy's idea to wrap all sysfs stuff in one deamon, then all
>> clients (via his library) will communicate with this daemon in order to
>> set different policies.  So all you care is to secure this daemon, not
>> random setuid programs that others may wrote.
> 
> Yep, that was the intent.  Though I've been thinking of changing it to use
> dbus rather than its own protocol.  If we can define a dbus protocol
> everyone is happy with, then we can have other implementations, while
> having consistent UI/policy tools.
> 
> 	J
