From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: [RFC] cpufreqtools
Date: Sun, 24 Oct 2004 18:30:25 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1098635425.4442.1.camel@localhost>
References: <20041021172227.GA24663@dominikbrodowski.de>
	<20041022143927.GE22405@poupinou.org>
	<20041022145738.GA2136@dominikbrodowski.de>
	<20041022172109.GF22405@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041022172109.GF22405@poupinou.org>
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
Cc: cpufreq list <cpufreq@www.linux.org.uk>

On Fri, 2004-10-22 at 19:21 +0200, Bruno Ducrot wrote:
> I do like Jeremy's idea to wrap all sysfs stuff in one deamon, then
> all clients (via his library) will communicate with this daemon in
> order to set different policies.  So all you care is to secure
> this daemon, not random setuid programs that others may wrote.

Yep, that was the intent.  Though I've been thinking of changing it to
use dbus rather than its own protocol.  If we can define a dbus protocol
everyone is happy with, then we can have other implementations, while
having consistent UI/policy tools.

	J
