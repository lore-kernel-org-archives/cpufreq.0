From: paul.devriendt@amd.com
Subject: RE: Cleanups for powernow-k8
Date: Tue, 13 Jan 2004 21:39:53 -0600
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <99F2150714F93F448942F9A9F112634C080EF39F@txexmtae.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: davej@redhat.com
Cc: linux-kernel@vger.kernel.org, mark.langsdorf@amd.com, cpufreq@www.linux.org.uk, pavel@ucw.cz, linux@brodo.de

>> Dave had a good idea of a minimal ACPI parser for trying to retrieve the
>> table of p-states from an ACPI BIOS without needing the full AML interpreter.
>> I will see if I can get that to work in powernow-k8-acpi 
>  
> If done properly, that parsing code could be shared by the K7 
> driver too.
> 
> 	Dave

Agreed. Function in a header file? Don't want the drivers attempting to
call each other at runtime.
