From: "Martin J. Bligh" <mbligh@aracnet.com>
Subject: Re: New PowerManagement - cpufreq category?
Date: Mon, 16 Feb 2004 14:52:41 -0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <47480000.1076971961@flay>
References: <20040216081412.GA8955@dominikbrodowski.de>
	<6350000.1076946204@[10.10.2.4]>
	<20040216185908.GA8531@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040216185908.GA8531@dominikbrodowski.de>
Content-Disposition: inline
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: bugme-admin@osdl.org, cpufreq@www.linux.org.uk

--On Monday, February 16, 2004 19:59:08 +0100 Dominik Brodowski <linux@dominikbrodowski.de> wrote:

> On Mon, Feb 16, 2004 at 07:43:25AM -0800, Martin J. Bligh wrote:
>> --Dominik Brodowski <mail@dominikbrodowski.de> wrote (on Monday, February 16, 2004 09:14:12 +0100):
>> 
>> > Quoting
>> > ------- Additional Comment #1 From Len Brown  2004-02-14 22:53 -------
>> > from bug #2081:
>> > "(we really should have a better category than power-management/other for
>> > cpufreq stuff)"
>> > 
>> > 
>> > What do you think about a new component "cpufreq" as part of 
>> > "Power Management"?
>> 
>> If it's a separated component that's receiving a fair number of bugs, 
> Currently, the open bugs #2025, #2081, #1696 and #2111 would fall under this
> category. Maybe I missed some, though.
> 
>> then yes we could. Who is the maintainer,
> Dave Jones <davej@redhat.com>
> 
>> and where does it lie under the source tree?
> drivers/cpufreq/ and, for i386 [though other archs also support cpufreq]
> arch/i386/kernel/cpu/cpufreq/

I double-checked with davej ... now created and he owns it, thanks to Jon ;-)
