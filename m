From: Bas Mevissen <ml@basmevissen.nl>
Subject: Re: Pentium-M (Centrino): no power saved?
Date: Fri, 19 Sep 2003 11:23:26 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3F6ACB0E.8050009@basmevissen.nl>
References: <m24qz9r0ko.fsf@tnuctip.rychter.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <m24qz9r0ko.fsf@tnuctip.rychter.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Rychter <jan@rychter.com>
Cc: cpufreq@www.linux.org.uk

Jan Rychter wrote:
> 
> and much to my surprise, even though /proc/cpufreq echoes my changes, I
> can see no resulting changes in power consumption as reported by ACPI
> battery proc entry.
> 

Can you verify the CPU speed with the bogomips userland utility? Or 
something else that gives a CPU-only performance impression.

Bas.
