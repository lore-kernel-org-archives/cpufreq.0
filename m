From: Bas Mevissen <ml@basmevissen.nl>
Subject: Re: [RFC] yet more file moves
Date: Wed, 27 Aug 2003 11:09:52 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3F4C7560.2080409@basmevissen.nl>
References: <20030827060229.GA4315@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20030827060229.GA4315@brodo.de>
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
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@www.linux.org.uk

Dominik Brodowski wrote:

> I hereby suggest that 
> a) for 2.4. and 2.6. drivers/cpufreq/userspace.c is moved to 
>    drivers/cpufreq/cpufreq-userspace.c,
> b) for 2.4, the x86 cpufreq drivers are moved to arch/i386/kernel/cpufreq/
> 

Sounds OK. But the arch-specific stuff in 2.6 is in 
arch/i386/kernel/cpu/cpufreq if I remember correctly?

Bas.
